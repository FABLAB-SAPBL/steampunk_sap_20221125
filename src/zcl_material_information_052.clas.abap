CLASS zcl_material_information_052 DEFINITION
    PUBLIC
    FINAL
    CREATE PUBLIC .
    PUBLIC SECTION.
        INTERFACES if_oo_adt_classrun.
    PROTECTED SECTION.

    PRIVATE SECTION.
        METHODS get_material_art
        IMPORTING matnr TYPE i_product-producttype
        RETURNING VALUE(material_art) TYPE i_product-producttype.
ENDCLASS.

CLASS zcl_material_information_052 IMPLEMENTATION.
    METHOD get_material_art.
        DATA material TYPE i_product.
        DATA production_date TYPE datn.
        DATA bool_tmp TYPE boole_d.

        production_date = sy-datum.

        SELECT SINGLE
        FROM i_product fields producttype
        WHERE product = @MATNR INTO CORRESPONDING FIELDS OF @MATERIAL .

*        MATERIAL_ART = MATERIAL-producttype.
        "test
    ENDMETHOD.

    METHOD if_oo_adt_classrun~main.

        DATA material_info TYPE REF TO zcl_material_information_052.
        material_info = NEW zcl_material_information_052( ).
        DATA(material_art) = material_info->get_material_art( 'RM34' ).
        out->write( material_art ).

    ENDMETHOD.
ENDCLASS.
